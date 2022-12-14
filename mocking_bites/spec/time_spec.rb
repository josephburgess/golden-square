require 'time'

describe 'TimeError' do
  it 'calls the API to check the time difference' do
    fake_requester = double :requester
    time_error = TimeError.new(fake_requester)
    time = Time.new(2022, 12, 14, 11, 53, 57)
    expect(fake_requester).to receive(:get).with(URI('https://worldtimeapi.org/api/ip')).and_return('{"abbreviation":"GMT","client_ip":"2a01:4b00:8588:5000:ac0f:1fe8:a2c1:93c7","datetime":"2022-12-14T11:53:57.781759+00:00","day_of_week":3,"day_of_year":348,"dst":false,"dst_from":null,"dst_offset":0,"dst_until":null,"raw_offset":0,"timezone":"Europe/London","unixtime":1671018837,"utc_datetime":"2022-12-14T11:53:57.781759+00:00","utc_offset":"+00:00","week_number":50}')
    expect(time_error.error(time)).to eq 0.781759
  end
end
