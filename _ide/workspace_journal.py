# 2026-02-06T15:25:48.150785700
import vitis

client = vitis.create_client()
client.set_workspace(path="PDC_Project")

client.delete_component(name="des_crypto")

comp = client.create_hls_component(name = "des_crypto",cfg_file = ["hls_config.cfg"],template = "empty_hls_component")

comp = client.get_component(name="des_crypto")
comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

cfg = client.get_config_file(path="/c:/02_work/PDC/PDC_Project/des_crypto/hls_config.cfg")

cfg.set_value(section="hls", key="syn.top", value="des_encrypt")

comp.run(operation="SYNTHESIS")

comp.run(operation="CO_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="SYNTHESIS")

comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="CO_SIMULATION")

