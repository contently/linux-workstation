# TODO verify that apt pinning prefs are correctly set

describe command('echo 1') do
  its('exit_status') { should eq 0 }
end
