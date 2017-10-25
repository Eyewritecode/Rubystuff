def skip_tracks(arr, i)
    start = inc = i % arr.size()
    count = 1
    while inc > 0 && count < arr.size() do
      c = start
      while (c + inc) % arr.size() != start
          before = (c - inc) % arr.size()
          arr[before], arr[c] = arr[c], arr[before]
          c = c + 1
      end
    	start = start - 1
    	count = count + 1
    end
end


=begin


Ruby Magnets


end
(c + inc) % arr.size()
arr[before]
(c - inc) % arr.size()
arr[before]
start = start - 1
count = count + 1
count = count + 1
<
(c + inc) % arr.size()
c + 1
while
until
>
!= start
begin

=end


# shorter version :D

def skip_tracks_simplified(songs, n)
	songs.rotate!(n)
end