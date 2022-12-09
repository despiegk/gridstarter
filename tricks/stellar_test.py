"""
This example shows how to issue assets on the Stellar network.
# See: https://developers.stellar.org/docs/issuing-assets/
"""

import bpdb
import json

# https://laboratory.stellar.org/#account-creator?network=test

from stellar_sdk.asset import Asset
from stellar_sdk.keypair import Keypair
from stellar_sdk.network import Network
from stellar_sdk.server import Server
from stellar_sdk.transaction_builder import TransactionBuilder

# Configure StellarSdk to talk to the horizon instance hosted by Stellar.org
# To use the live network, set the hostname to 'horizon.stellar.org'
server = Server(horizon_url="https://horizon-testnet.stellar.org")

# Keys for accounts to issue and receive the new asset
issuing_keypair = Keypair.from_secret(
    "SDP4L6IHXWCBIOOJTGGIG4NJK7WN4XQ7W5OIFYPUEKSLHZHRCD5OJHWU"
)


issuing_public = issuing_keypair.public_key
# pubkey = "GBAPX3SR53EFQOSG3V3VGYPWIIQENVSQXMKDGMVJKP2BP5MRWYOPFHLE"
# assert issuing_public == pubkey

distributor_keypair = Keypair.from_secret(
    "SBIUGP47DYIKIZQLYVEDQIJ3JI2YOF5RP4KUVDMYIHOKSXPUCLZLJCAG"
)
distributor_public = distributor_keypair.public_key

# Transactions require a valid sequence number that is specific to this account.
# We can fetch the current sequence number for the source account from Horizon.
distributor_account = server.load_account(distributor_public)

def infoget(name,r):
    print("****JSONSTART :" + name)
    print(json.dumps(r))
    print("****JSONEND")


# bpdb.set_trace()
infoget("info",{
        "account_id":distributor_account.account.account_id
    })
# bpdb.embed()
bpdb.bpython.embed()



# # Create an object to represent the new asset
# hello_asset = Asset("Hello", issuing_public)

# # First, the receiving account must trust the asset
# trust_transaction = (
#     TransactionBuilder(
#         source_account=distributor_account,
#         network_passphrase=Network.TESTNET_NETWORK_PASSPHRASE,
#         base_fee=100,
#     )
#     .append_change_trust_op(asset=hello_asset)
#     .set_timeout(30)
#     .build()
# )

# trust_transaction.sign(distributor_keypair)
# resp = server.submit_transaction(trust_transaction)
# print(f"Change Trust Op Resp:\n{resp}")
# print("-" * 32)

# issuing_account = server.load_account(issuing_public)
# # Second, the issuing account actually sends a payment using the asset.
# # We recommend that you use the distribution account to distribute assets and
# # add more security measures to the issue account. Other acceptances should also
# # add a trust line to accept assets like the distribution account.
# payment_transaction = (
#     TransactionBuilder(
#         source_account=issuing_account,
#         network_passphrase=Network.TESTNET_NETWORK_PASSPHRASE,
#         base_fee=100,
#     )
#     .append_payment_op(destination=distributor_public, amount="1000", asset=hello_asset)
#     .set_timeout(30)
#     .build()
# )
# payment_transaction.sign(issuing_keypair)
# resp = server.submit_transaction(payment_transaction)
# print(f"Payment Op Resp:\n{resp}")
