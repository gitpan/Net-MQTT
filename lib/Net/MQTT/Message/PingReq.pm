use strict;
use warnings;
package Net::MQTT::Message::PingReq;
$Net::MQTT::Message::PingReq::VERSION = '1.143260';
# ABSTRACT: Perl module to represent an MQTT PingReq message


use base 'Net::MQTT::Message';

sub message_type {
  12
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Net::MQTT::Message::PingReq - Perl module to represent an MQTT PingReq message

=head1 VERSION

version 1.143260

=head1 SYNOPSIS

  # instantiated by Net::MQTT::Message

=head1 DESCRIPTION

This module encapsulates a single MQTT Ping Request message.  It is a
specific subclass used by L<Net::MQTT::Message> and should not
need to be instantiated directly.

=head1 AUTHOR

Mark Hindess <soft-cpan@temporalanomaly.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Mark Hindess.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
