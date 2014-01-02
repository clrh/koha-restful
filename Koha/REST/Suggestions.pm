package Koha::REST::Suggestions;

use base 'CGI::Application';
use Modern::Perl;
use JSON;

use Koha::REST::Response qw(format_response response_boolean format_error);

use C4::Suggestions;

sub setup {
    my $self = shift;
    $self->run_modes(
        create_suggestion => 'rm_create_suggestion',
        edit_suggestion => 'rm_edit_suggestion',
        get_suggestion => 'rm_get_suggestion',
        get_suggestions => 'rm_get_suggestions',
        delete_suggestion => 'rm_delete_suggestion',
    );
}

sub rm_create_suggestion {
    my $self = shift;
    my $q = $self->query;

    my $suggestion = eval { from_json($q->param('data')) };
    if ($@) {
        my $response = {
            error => "Failed to parse data parameter: $@",
        };
        return format_error($self, '400 Bad Request', $response);
    }

    if (ref $suggestion ne 'HASH') {
        my $response = {
            error => "data parameter should be a hash.",
        };
        return format_error($self, '400 Bad Request', $response);
    }

    my $suggestionid = NewSuggestion($suggestion);
    unless ($suggestionid) {
        my $response = {
            error => "Failed to create suggestion.",
        };
        return format_error($self, '500 Internal Server Error', $response);
    }

    $suggestion = GetSuggestion($suggestionid);

    return format_response($self, $suggestion);
}

sub rm_edit_suggestion {
    my $self = shift;
    my $q = $self->query;

    my $suggestionid = $self->param('suggestionid');
    my $suggestion = eval { from_json($q->param('data')) };
    if ($@) {
        my $response = {
            error => "Failed to parse data parameter: $@",
        };
        return format_error($self, '400 Bad Request', $response);
    }

    if (ref $suggestion ne 'HASH') {
        my $response = {
            error => "data parameter should be a hash.",
        };
        return format_error($self, '400 Bad Request', $response);
    }

    $suggestion->{suggestionid} = $suggestionid;

    my $status = ModSuggestion($suggestion);
    if (!$status) {
        my $response = {
            error => "Failed to update suggestion.",
        };
        return format_error($self, '500 Internal Server Error', $response);
    } elsif ($status == 0) {
        my $response = {
            error => "Suggestion not found.",
        };
        return format_error($self, '404 Not Found', $response);
    }

    $suggestion = GetSuggestion($suggestionid);

    return format_response($self, $suggestion);
}

sub rm_get_suggestion {
    my $self = shift;

    my $suggestionid = $self->param('suggestionid');
    my $suggestion = GetSuggestion($suggestionid);
    if (not defined $suggestion) {
        my $response = {
            error => "Suggestion not found",
        };
        return format_error($self, '404 Not Found', $response);
    }

    return format_response($self, $suggestion);
}

sub rm_get_suggestions {
    my $self = shift;
    my $q = $self->query;

    my $filters = {$q->Vars};

    my $suggestions = SearchSuggestion($filters);

    return format_response($self, $suggestions);
}

sub rm_delete_suggestion {
    my $self = shift;

    my $suggestionid = $self->param('suggestionid');
    my $deleted = DelSuggestion(0, $suggestionid, 'intranet');
    if ($deleted == 0) {
        my $response = {
            error => "Suggestion not found.",
        };
        return format_error($self, '404 Not Found', $response);
    }

    my $response = {
        success => response_boolean(1),
    };

    return format_response($self, $response);
}

1;
