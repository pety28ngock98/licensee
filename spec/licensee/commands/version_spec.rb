# frozen_string_literal: true

RSpec.describe 'version command' do
  let(:command) { ['bundle', 'exec', 'bin/licensee', 'version'] }
  let(:arguments) { [] }
  let(:output) do
    Dir.chdir project_root do
      Open3.capture3(*[command, arguments].flatten)
    end
  end
  let(:parsed_output) { YAML.safe_load(stdout) }
  let(:stdout) { output[0] }
  let(:stderr) { output[1] }
  let(:status) { output[2] }

  it 'returns the version' do
    expect(stdout).to include(Licensee::VERSION)
  end

  it 'Returns a zero exit code' do
    expect(status.exitstatus).to be(0)
  end
end
