
dont do all these
=pod
#!/usr/bin/perl -w

use warnings;
use strict;
use Data::Dumper;
my %month_map =(
	jan =>'01',
	feb =>'02',
	mar =>'03',
	apr =>'04',
	may =>'05',
	jun =>'06',
	jul =>'07',
	aug =>'08',
	sep =>'09',
	oct =>'10',
	nov =>'11',
	dec =>'12'

);
my $mn =0;
my $val =0;
my $year;
my $month;
my $day;
my $currentyear;
my $currentmonth;
my $currentday;
print "Enter the date ";
my $input = <>;
chomp($input);


if($input =~ m/([0-9]{1,}).([0-9]{1,}|[a-z]{3,}).([0-9]{4})/i)
{
	$day =$1;
	$month =$2;
	$year  =$3;

	if($month =~/[a-z]/i)
	{
		foreach my $temp_var (keys %month_map)
		{
			if($temp_var eq $month)
			{
				$val = $month_map{$temp_var};
				print "Date Format :$day|$val|$year\n";
			}
		}
	}
	else
	{
		$val = $month;

	}	
	if($day>31)
	{
		print "Invalid day \n";
		exit;
	}
}



my $sysdate = localtime;

my @values = split(' ', $sysdate);
$currentyear =  $values[4];
$currentday =   $values[2];
$currentmonth  = $values[1];
my $age = $currentyear - $year;
my $lcmonth = lc $currentmonth;




foreach my $var (keys %month_map)
{
	if($var eq $lcmonth)
	{
		$mn =$month_map{$var};
	}
}

my @splitday =split(//, $day);

if($splitday[0]==0) 
{
	$day =$splitday[1];
}	
if($val>12 )
{
print "Invalid month\n";
exit;
}	

print "Present age is : $age \n ";

if($mn == $val && $day == $currentday)
{
	print "Happy b'day\n";
}

