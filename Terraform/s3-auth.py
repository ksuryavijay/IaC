import oci
import uuid
import base64
from pathlib import Path

config = oci.config.from_file(file_location=str(Path.home())+'/.oci/config', profile_name='DEFAULT')

secrets_client = oci.secrets.SecretsClient(config)
result = uuid.uuid4()
#secret_id = "ocid1.vaultsecret.oc1.me-jeddah-1.amaaaaaar3ercziar3pmfe55msrj6oq4xgxsoxr5tpzr3ealljy256opzrea"
secret_id = "ocid1.vaultsecret.oc1.iad.amaaaaaazjgvoqyafuyhoiy35cosfhlc475mbihrim2imlmw7dlxrdaewhda"

get_secret_bundle_response = secrets_client.get_secret_bundle(
    secret_id           = secret_id,
    opc_request_id      = result.hex,
    #version_number      = 2,
    stage               = "LATEST")

# Get the data from response
#print(get_secret_bundle_response.data)
scrt_content = get_secret_bundle_response.data.secret_bundle_content
#print(scrt_content)

decoded = base64.b64decode(scrt_content.content)
print(decoded)

#create folder structure for s3 credentials
filepath = str(Path.home())+"/.aws"
p = Path(filepath)
p.mkdir(parents=True, exist_ok=True)

#create s3 credentials file and wrtite secrets to file.
filename = filepath+"/credentials"
print(filename)

with open(filename, 'w+', encoding="utf-8") as output_file:
  output_file.write(decoded.decode("utf-8"))
