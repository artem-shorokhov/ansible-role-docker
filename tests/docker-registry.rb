control 'packages' do
  impact 1.0
  title 'Required packages should be installed.'
  describe package('docker-ce') do
    it { should be_installed }
  end
  describe package('nginx') do
    it { should be_installed }
  end
end

control 'nginx-config' do
  impact 1.0
  title 'nginx configustaion file should be in place.'
  describe file('/etc/nginx/nginx.conf') do
    it { should exist }
    its('content') { should match proxy_pass http://localhost:5000; }
  end
end

control 'docker-service' do
  impact 1.0
  title 'Docker service should be installed/enabled/running.'
  describe service('docker') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end
end

control 'nginx-service' do
  impact 1.0
  title 'nginx service should be installed/enabled/running.'
  describe service('nginx') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end
end

control 'sssl-port-is-open' do
  impact 1.0
  title 'SSL port should be listening.'
  describe port(443) do
    it { should be_listening }
  end
end

control 'redirect' do
  impact 1.0
  title 'Requests on port 80 should be redirected to port 443.'
  describe http('http://localhost') do
    its('status') { should cmp 301 }
  end
end
