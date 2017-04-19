Facter.add(:is_puppetmaster) do
setcode do
Facter.value(:hostname) == 'pserver'
end
end


