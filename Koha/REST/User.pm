package Koha::REST::User;

use base 'CGI::Application';
use Modern::Perl;

use Koha::REST::Response qw(format_response response_boolean);
use C4::Reserves;
use C4::Circulation;
use C4::Biblio;
use C4::Items;
use C4::Branch;
use C4::Members;
use YAML;
use File::Basename;
use JSON;

sub setup {
    my $self = shift;
    $self->run_modes(
        create_user => 'rm_create_user',
        edit_user => 'rm_edit_user',
        get_holds_byid => 'rm_get_holds_byid',
        get_holds => 'rm_get_holds',
        get_issues_byid => 'rm_get_issues_byid',
        get_issues => 'rm_get_issues',
        get_issues_history_byid => 'rm_get_issues_history_byid',
        get_issues_history => 'rm_get_issues_history',
        get_today => 'today',
        get_all => 'all',
        login_exists => 'rm_login_exists',
    );
}

sub get_borrowernumber {
    my ($userid) = @_;

    my $borrower = C4::Members::GetMember(userid => $userid);
    return $borrower->{borrowernumber};
}

sub rm_get_holds_byid {
    my $self = shift;
    my $borrowernumber = $self->param('borrowernumber');

    return format_response($self, get_holds($borrowernumber));
}

sub rm_get_holds {
    my $self = shift;
    my $user_name = $self->param('user_name');
    my $borrowernumber = get_borrowernumber($user_name);

    return format_response($self, get_holds($borrowernumber));
}

sub rm_get_issues_byid {
    my $self = shift;
    my $borrowernumber = $self->param('borrowernumber');

    return format_response($self, get_issues($borrowernumber));
}

sub rm_get_issues {
    my $self = shift;
    my $user_name = $self->param('user_name');
    my $borrowernumber = get_borrowernumber($user_name);

    return format_response($self, get_issues($borrowernumber));
}


# return current holds of a koha patron
sub get_holds {
    my ($borrowernumber) = @_;
    return [] unless ($borrowernumber);

    my $response = [];
    my @holds = C4::Reserves::GetReservesFromBorrowernumber($borrowernumber);
    foreach my $hold (@holds) {
        # Up to Koha 3.8 GetBiblio returns an array whose last element is the
        # biblio hash.
        # Starting with Koha 3.10 GetBiblio returns only the biblio hash.
        # Getting the last element of what is returned by this sub allow to be
        # compatible with all versions.
        my $biblio = (C4::Biblio::GetBiblio($hold->{biblionumber}))[-1];
        my $item = C4::Items::GetItem($hold->{itemnumber});
        push @$response, {
            hold_id => $hold->{reserve_id},
            rank => $hold->{priority},
            reservedate => $hold->{reservedate},
            biblionumber => $hold->{biblionumber},
            branchcode => $hold->{branchcode},
            itemnumber => $hold->{itemnumber},
            title => $biblio ? $biblio->{title} : '',
            barcode => $item ? $item->{barcode} : '',
            itemcallnumber => $item ? $item->{itemcallnumber} : '',
            branchname => C4::Branch::GetBranchName($hold->{branchcode}),
            cancellationdate => $hold->{cancellationdate},
            found => $hold->{found},
        };
    }

    return $response;
}

# return current issues of a koha patron
sub get_issues {
    my ($borrowernumber) = @_;
    return [] unless ($borrowernumber);

    my $response = [];
    my $issues = C4::Members::GetPendingIssues($borrowernumber);
    if ($issues) {
        foreach my $issue (@$issues) {
            my $itemnumber = $issue->{itemnumber};
            my ($renewable, $error) = C4::Circulation::CanBookBeRenewed(
                $borrowernumber, $itemnumber);

            # Community master version returns DateTime objects but older
            # versions return dates as ISO formatted strings.
            my $date_due = (ref $issue->{date_due} eq "DateTime")
                ? $issue->{date_due}->datetime : $issue->{date_due};
            my $issuedate = (ref $issue->{issuedate} eq "DateTime")
                ? $issue->{issuedate}->datetime : $issue->{issuedate};

            my $item = C4::Items::GetItem($itemnumber);

            my $r = {
                borrowernumber => $issue->{borrowernumber},
                branchcode => $issue->{branchcode},
                holdingbranch => $item ? C4::Branch::GetBranchName($item->{holdingbranch}) : '',
                itemnumber => $issue->{itemnumber},
                date_due => $date_due,
                issuedate => $issuedate,
                biblionumber => $issue->{biblionumber},
                title => $issue->{title},
                barcode => $issue->{barcode},
                renewable => response_boolean($renewable),
                itemcallnumber => $item->{itemcallnumber},
            };
            if ( (not $renewable) and $error) {
                $r->{reasons_not_renewable} = $error;
            }

            push @$response, $r;
        };
    }

    return $response;
}

sub get_issues_history {
    my ($borrowernumber) = @_;

    my $issues = C4::Members::GetAllIssues($borrowernumber, 'issuestimestamp');
    return $issues;
}

sub rm_get_issues_history {
    my $self = shift;
    my $user_name = $self->param('user_name');
    my $borrower = C4::Members::GetMember(userid => $user_name);
    my $borrowernumber = $borrower->{borrowernumber};

    return format_response($self, get_issues_history($borrowernumber));
}

sub rm_get_issues_history_byid {
    my $self = shift;
    my $borrowernumber = $self->param('borrowernumber');

    return format_response($self, get_issues_history($borrowernumber));
}

sub today {
    my $self = shift;
    # read the config file, we will use the borrowerfields filter if they exist
    my $conf_path = dirname($ENV{KOHA_CONF});
    my $conf = YAML::LoadFile("$conf_path/rest/config.yaml");

    my $today_patrons;
    if ($conf->{borrowerfields} ) {
        $today_patrons = C4::Members::Search({'dateenrolled'=>C4::Dates->today('iso') }, undef, undef, $conf->{borrowerfields}  );
    } else {
        $today_patrons = C4::Members::Search({'dateenrolled'=>C4::Dates->today('iso') } );
    }
    foreach my $patron (@$today_patrons) {
        my $attributes = C4::Members::Attributes::GetBorrowerAttributes($patron->{borrowernumber});
        $patron->{attributes} = $attributes;
    }

    return format_response($self, $today_patrons);
}

sub all {
    my $self = shift;
    # read the config file, we will use the borrowerfields filter if they exist
    my $conf_path = dirname($ENV{KOHA_CONF});
    my $conf = YAML::LoadFile("$conf_path/rest/config.yaml");

    my $all_patrons;
    if ($conf->{borrowerfields} ) {
        $all_patrons = C4::Members::Search({}, undef, undef, $conf->{borrowerfields}  );
    } else {
        $all_patrons = C4::Members::Search({} );
    }

    foreach my $patron (@$all_patrons) {
        my $attributes = C4::Members::Attributes::GetBorrowerAttributes($patron->{borrowernumber});
        $patron->{attributes} = $attributes;
    }
    
    return format_response($self, $all_patrons);
}

# Does the given login exists in Koha?
sub rm_login_exists {
    my $self = shift;
    my $login = $self->param('user_name');
    my $response = {
        exist => response_boolean(!Check_Userid($login, '')),
    };
    return format_response($self, $response);
}

# Creates a user
sub rm_create_user {
    my $self = shift;
    my $q = $self->query;

    my $jsondata = $q->param('data');
    my $data = from_json($jsondata);

    # If no categorycode is provided, we use the default categorycode for self registration
    $$data{'categorycode'} = C4::Context->preference('PatronSelfRegistrationDefaultCategory') unless $$data{'categorycode'};

    my $result = AddMember(%$data);
    my $response = {
        borrowernumber => $result,
    };
    return format_response($self, $response);
}

sub rm_edit_user {
    my $self = shift;
    my $q = $self->query;

    my $userid = $self->param('user_name');
    my $borrower = C4::Members::GetMember(userid => $userid);

    unless ($borrower) {
        return format_error($self, '404 Not Found', {
            error => "Borrower not found.",
        });
    }

    my $borrowernumber = $borrower->{borrowernumber};

    my $data = from_json($q->param('data'));
    my $response;
    if ($data and ref $data eq "HASH") {
        delete $data->{borrowernumber};

        my $success = C4::Members::ModMember(borrowernumber => $borrowernumber, %$data);

        $response = {
            success => response_boolean($success),
        };
        if ($success) {
            $borrower = C4::Members::GetMember(borrowernumber => $borrowernumber);
            my %modified;
            foreach my $key (keys %$data) {
                if (exists $borrower->{$key}) {
                    $modified{$key} = $borrower->{$key};
                }
            }

            # Hide password hash, but leave key in hash.
            if (defined $modified{password}) {
                $modified{password} = undef;
            }

            $response->{modified_fields} = \%modified;
        }
    } else {
        $response = {
            success => response_boolean(1),
            modified_fields => {},
        };
    }

    return format_response($self, $response);
}

1;
