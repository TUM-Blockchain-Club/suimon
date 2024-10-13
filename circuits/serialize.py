import json

def decimal_to_bytes(s):
    return int(s).to_bytes(32, byteorder='little')

def serialize_g1_point(g1_point):
    x = decimal_to_bytes(g1_point[0])
    y = decimal_to_bytes(g1_point[1])
    return x + y

def serialize_g2_point(g2_point):
    x0 = decimal_to_bytes(g2_point[0][0])
    x1 = decimal_to_bytes(g2_point[0][1])
    y0 = decimal_to_bytes(g2_point[1][0])
    y1 = decimal_to_bytes(g2_point[1][1])
    return x0 + x1 + y0 + y1

def serialize_verifying_key(vk):
    vk_bytes = b''
    vk_bytes += serialize_g1_point(vk['vk_alpha_1'])
    vk_bytes += serialize_g2_point(vk['vk_beta_2'])
    vk_bytes += serialize_g2_point(vk['vk_gamma_2'])
    vk_bytes += serialize_g2_point(vk['vk_delta_2'])
    # Optionally include the length of IC
    ic_length = len(vk['IC']).to_bytes(32, byteorder='little')
    vk_bytes += ic_length
    for ic_point in vk['IC']:
        vk_bytes += serialize_g1_point(ic_point)
    return vk_bytes

def serialize_proof(proof):
    proof_bytes = b''
    proof_bytes += serialize_g1_point(proof['pi_a'])
    proof_bytes += serialize_g2_point(proof['pi_b'])
    proof_bytes += serialize_g1_point(proof['pi_c'])
    return proof_bytes

def serialize_public_inputs(public_inputs):
    public_inputs_bytes = b''
    for value in public_inputs:
        public_inputs_bytes += int(value).to_bytes(32, byteorder='little')
    return public_inputs_bytes

# Load data from JSON files
with open('verification_key.json') as f:
    vk = json.load(f)
with open('proof.json') as f:
    proof = json.load(f)
with open('public.json') as f:
    public_inputs = json.load(f)

# Serialize the components
vk_bytes = serialize_verifying_key(vk)
proof_bytes = serialize_proof(proof)
public_inputs_bytes = serialize_public_inputs(public_inputs)

# Convert to hex strings for Move code
vk_hex = vk_bytes.hex()
proof_hex = proof_bytes.hex()
public_inputs_hex = public_inputs_bytes.hex()

print("Verifying Key Hex:", vk_hex)
print("Proof Hex:", proof_hex)
print("Public Inputs Hex:", public_inputs_hex)
