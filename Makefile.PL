use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile
  NAME   	=> 'ttylog',
  VERSION_FROM	=> 'ttylog',
  EXE_FILES	=> [ 'ttylog' ],
  PREREQ_PM	=> {},
  ;

package MY;

sub libscan {
  my $self = shift;
  my $path = shift;
  ($path =~ / \bCVS\b | \~$ /x) ? undef : $path;
} 
  
sub postamble {
  return qq^

pm_to_blib: README

README: \$(VERSION_FROM)
\tpod2text \$(VERSION_FROM) > README

^;
} 

1;
