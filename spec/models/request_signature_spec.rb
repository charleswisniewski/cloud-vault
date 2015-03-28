require 'rails_helper'

RSpec.describe RequestSignature, type: :model do
  # vovayartsev / 2015-03-28T13:53:02.547Z / 12345678'
  let(:base64_signature) { 'LS0tLS1CRUdJTiBQR1AgU0lHTkVEIE1FU1NBR0UtLS0tLQpIYXNoOiBTSEE1MTIKCnZvdmF5YXJ0c2V2IC8gMjAxNS0wMy0yOFQxMzo1MzowMi41NDdaIC8gMTIzNDU2NzgKLS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogS2V5YmFzZSBPcGVuUEdQIHYyLjAuOApDb21tZW50OiBodHRwczovL2tleWJhc2UuaW8vY3J5cHRvCgp3c0JjQkFBQkNnQUdCUUpWRnVuMEFBb0pFT25iS3JQQXJFcVlRek1ILzBOVVdiSHA4aUZhMk1wRVA2RGtFSS9zCkI2ZFF6OHhLa1R4NFhKTXY0LzhXWXlqSTJsQ0N3WUx1WFVTT0Z0eEU3eGxLRUVIZ1pWcnpxQUFtc0lXVDZmejAKU2xJSEZWWXZ1dGtoZ2U5ME9LeS81aEF3dWVlYkdieW4zQVE0NXNUeVhlMXQwblZ2RnN4U29GY2JMMnZ2ODVmZgpDaklUOWlFY3o0N0FLRUluRUNCa0hJSXhHRE8rTzFIWDVwY3ZiWWpzMnJJQ2xnNks2Q1ZMcS9LcncvaXhZRW5MCjYrbGlMUEZWS0hPVnIvVzB6cGtGMVRJcUpGcktDc3c3ckZNSURUNXR1dmRJWHg0YXZMMlM1TFBiTFdlZWpYTWoKcSt1bXlVUHlNSDVlTzlOSWpvTVh4b1pSaXZ4OFplbEdYbUtrdlFmTkhNay9WbkhFVzRrZG14TXdQRk5kY2lBPQo9MjlUMgotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0KCg==' }

  let(:request_signature) { described_class.new(base64_signature) }

  it 'validates and decodes signature' do
    expect { request_signature.validate! }.not_to raise_error
    expect(request_signature.kb_login).to eq('vovayartsev')
    expect(request_signature.timestamp.min).to eq(53)
    expect(request_signature.csrf_token).to eq('12345678')
  end
end

