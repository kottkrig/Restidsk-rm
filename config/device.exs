use Mix.Config

config :nerves, :firmware, rootfs_overlay: "rootfs_overlay"

config :shoehorn,
  init: [:nerves_runtime, :nerves_init_gadget],
  app: Mix.Project.config()[:app]

config :logger, backends: [RingLogger]

keys =
  [
    Path.join([System.user_home!(), ".ssh", "id_rsa.pub"]),
    Path.join([System.user_home!(), ".ssh", "id_ecdsa.pub"]),
    Path.join([System.user_home!(), ".ssh", "id_ed25519.pub"])
  ]
  |> Enum.filter(&File.exists?/1)

if keys == [],
  do:
    Mix.raise("""
    No SSH public keys found in ~/.ssh. An ssh authorized key is needed to
    log into the Nerves device and update firmware on it using ssh.
    See your project's config.exs for this error message.
    """)

config :nerves_firmware_ssh,
  authorized_keys: Enum.map(keys, &File.read!/1)

node_name = if Mix.env() != :prod, do: "eink"

config :nerves_init_gadget,
  ifname: "wlan0",
  address_method: :dhcp,
  mdns_domain: "nerves.local",
  node_name: node_name,
  node_host: :mdns_domain

key_mgmt = System.get_env("NERVES_NETWORK_KEY_MGMT") || "WPA-PSK"

config :nerves_network, :default,
  wlan0: [
    ssid: System.get_env("NERVES_NETWORK_SSID") || "No bananas",
    psk: System.get_env("NERVES_NETWORK_PSK") || "fruktsallad",
    key_mgmt: String.to_atom(key_mgmt)
  ]

config :eink, :viewport, %{
  name: :main_viewport,
  default_scene: {Eink.Scene.Main, nil},
  # Note: Match these to your inky display
  size: {400, 300},
  opts: [scale: 1.0],
  drivers: [
    %{
      module: ScenicDriverInky,
      opts: [
        # Note: Match these to your Inky display
        type: :what,
        accent: :red,
        opts: %{
          border: :black
        }
      ]
    }
  ]
}
