package Tie::IxHash::FixedSize;

use 5.006;
use strict;
use base 'Tie::IxHash';

our $VERSION = 0.10;

# location of size field in @$self
use constant SIZE_IX => 4;

sub TIEHASH {
    my $class = shift;
    my $conf = shift if ref $_[0] eq 'HASH';

    $conf ||= {};

    my $self = $class->SUPER::TIEHASH(@_);

    if ($conf->{size}) {
        $self->[SIZE_IX] = $conf->{size};
    }

    return $self;
}

sub STORE {
    my $self = shift;

    $self->SUPER::STORE(@_);

    if (my $max_size = $self->[SIZE_IX]) {
        while ($self->Keys > $max_size) {
            $self->Shift;
        }
    }
}

1;

__END__

=head1 NAME

Tie::IxHash::FixedSize - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Tie::IxHash::FixedSize;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Tie::IxHash::FixedSize, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

Michael Schout, E<lt>mschout@E<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2008 by Michael Schout

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.8 or,
at your option, any later version of Perl 5 you may have available.


=cut
