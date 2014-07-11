

use Benchmark qw( cmpthese );
sub myreverse {
    my @string = split //, shift();
    my @new;
    for( my $ix = $#string; $ix >= 0; --$ix ) {
        push @new, $string[$ix];
    }
    return join '', @new;
}
sub perlreverse {
    my $string = shift;
    return reverse $string;
}

our $str = "Now is the time for all good men to come to the aid...";

cmpthese ( 
    -5, {
        mine  => sub { my $rev = myreverse( $main::string )   },
        perls => sub { my $rev = perlreverse( $main::string ) },
} );
