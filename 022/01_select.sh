#!/bin/bash

PS3='Choose your favorite music genre: ' 

echo

select genre in "Folk" "Country" "Electronic" "Pop" "Metal" "Rock" "Techno" "Classical"
do
  echo
  echo "Your favorite genre is $genre."
  echo "You're cool!"
  echo
  break 
done

exit