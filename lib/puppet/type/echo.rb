Puppet::Type.newtype(:echo) do
  @doc = <<-EOT
    This type prints your message as a Notice in your report without
    logging a change
  EOT

  newparam(:name) do
    isnamevar
    desc "This is the name of the message."
  end

  newparam(:message) do
    desc "This is the content we will actually print.  If omitted the name will be printed"
    EOT
  end

  validate do
    if parameters[:message].nil?
      msg = parameters[:name].value
    else
      msg = parameters[:message].value
    end

    # Print a message
    Puppet.notice(self.path + "/message: #{msg}")
  end
end

