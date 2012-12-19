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

sub setup {
    my $self = shift;
    $self->run_modes(
        get_holds_byid => 'rm_get_holds_byid',
        get_holds => 'rm_get_holds',
        get_issues_byid => 'rm_get_issues_byid',
        get_issues => 'rm_get_issues',
        get_today => 'today',
        get_all => 'all',
    );
}

sub rm_get_holds_byid {
    my $self = shift;
    my $borrowernumber = $self->param('borrowernumber');

    return format_response($self, get_holds($borrowernumber));
}

sub rm_get_holds {
    my $self = shift;
    my $user_name = $self->param('user_name');
    my $borrower = C4::Members::GetMember(userid => $user_name);
    my $borrowernumber = $borrower->{borrowernumber};

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
    my $borrower = C4::Members::GetMember(userid => $user_name);
    my $borrowernumber = $borrower->{borrowernumber};

    return format_response($self, get_issues($borrowernumber));
}


# return current holds of a koha patron
sub get_holds {
    my ($borrowernumber) = @_;
    return [] unless ($borrowernumber);

    my $response = [];
    my @holds = C4::Reserves::GetReservesFromBorrowernumber($borrowernumber);
    foreach my $hold (@holds) {
        my (undef, $biblio) = C4::Biblio::GetBiblio($hold->{biblionumber});
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

            my $r = {
                borrowernumber => $issue->{borrowernumber},
                branchcode => $issue->{branchcode},
                itemnumber => $issue->{itemnumber},
                date_due => $date_due,
                issuedate => $issuedate,
                biblionumber => $issue->{biblionumber},
                title => $issue->{title},
                barcode => $issue->{barcode},
                renewable => response_boolean($renewable),
            };
            if ( (not $renewable) and $error) {
                $r->{reasons_not_renewable} = $error;
            }

            push @$response, $r;
        };
    }

    return $response;
}

sub today {
    my $self = shift;
    my $today_patrons = C4::Members::Search({'dateenrolled'=>C4::Dates->today('iso') });
    foreach my $patron (@$today_patrons) {
        my $attributes = C4::Members::Attributes::GetBorrowerAttributes($patron->{borrowernumber});
        $patron->{attributes} = $attributes;
    }

    return format_response($self, $today_patrons);
}

sub all {
    my $self = shift;
    my $all_patrons = C4::Members::Search({});
    foreach my $patron (@$all_patrons) {
        my $attributes = C4::Members::Attributes::GetBorrowerAttributes($patron->{borrowernumber});
        $patron->{attributes} = $attributes;
    }
    
    return format_response($self, $all_patrons);
}

1;
