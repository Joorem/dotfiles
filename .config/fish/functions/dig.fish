function dig
  command dig $argv | awk '
    !/^;/    { print "\033[32m"$0 }
    /^;;/    { print "\033[36m"$0 }
    END      { print "\033[0m" }
  ';
end
