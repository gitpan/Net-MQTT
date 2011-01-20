use strict;
use warnings;
package Net::MQTT::Message::Unsubscribe;
BEGIN {
  $Net::MQTT::Message::Unsubscribe::VERSION = '1.110200';
}

# ABSTRACT: Perl module to represent an MQTT Unsubscribe message


use base 'Net::MQTT::Message';
use Net::MQTT::Constants qw/:all/;

sub message_type {
  10
}

sub _default_qos {
  MQTT_QOS_AT_LEAST_ONCE
}


sub message_id { shift->{message_id} }


sub topics { shift->{topics} }

sub _topics_string { join  ',', @{shift->{topics}} }

sub _remaining_string {
  my ($self, $prefix) = @_;
  $self->message_id.' '.$self->_topics_string.' '.
    $self->SUPER::_remaining_string($prefix)
}

sub _parse_remaining {
  my $self = shift;
  $self->{message_id} = decode_short($self->{remaining});
  while (length $self->{remaining}) {
    push @{$self->{topics}}, decode_string($self->{remaining});
  }
}

sub _remaining_bytes {
  my $self = shift;
  my $o = encode_short($self->message_id);
  foreach my $name (@{$self->topics}) {
    $o .= encode_string($name);
  }
  $o
}

1;

__END__
=pod

=head1 NAME

Net::MQTT::Message::Unsubscribe - Perl module to represent an MQTT Unsubscribe message

=head1 VERSION

version 1.110200

=head1 SYNOPSIS

  # instantiated by Net::MQTT::Message

=head1 DESCRIPTION

This module encapsulates a single MQTT Unsubscribe message.  It is a
specific subclass used by L<Net::MQTT::Message> and should not
need to be instantiated directly.

=head1 METHODS

=head2 C<message_id()>

Returns the message id field of the MQTT Unsubscribe message.

=head2 C<topics()>

Returns the list of topics of the MQTT Subscribe message.

=head1 AUTHOR

Mark Hindess <soft-cpan@temporalanomaly.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Mark Hindess.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

