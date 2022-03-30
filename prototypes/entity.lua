-- Blueprint deployer
local deployer = table.deepcopy(data.raw["container"]["steel-chest"])
deployer.name = "blueprint-deployer"
deployer.icon = "__patorio-recursive-blueprints__/graphics/blueprint-deployer-icon.png"
deployer.minable.result = "blueprint-deployer"
deployer.inventory_size = 1
deployer.enable_inventory_bar = false
deployer.se_allow_in_space = true
deployer.picture.layers = {
  {
    filename = "__patorio-recursive-blueprints__/graphics/blueprint-deployer.png",
    width = 32,
    height = 36,
    shift = util.by_pixel(0, -2),
    priority = "high",
    hr_version = {
      filename = "__patorio-recursive-blueprints__/graphics/hr-blueprint-deployer.png",
      width = 66,
      height = 72,
      shift = util.by_pixel(0, -2.5),
      scale = 0.5,
      priority = "high",
    }
  },
  {
    filename = "__base__/graphics/entity/roboport/roboport-base-animation.png",
    width = 42,
    height = 31,
    shift = util.by_pixel(0, -17.5),
    priority = "high",
    hr_version = {
        filename = "__base__/graphics/entity/roboport/hr-roboport-base-animation.png",
        width = 83,
        height = 59,
        shift = util.by_pixel(0.25, -17),
        scale = 0.5,
        priority = "high",
    },
  },
  -- Shadow
  table.deepcopy(data.raw["container"]["iron-chest"].picture.layers[2])
}
data:extend{deployer}

-- Resource scanner
local accumulator = table.deepcopy(data.raw["accumulator"]["accumulator"])
local substation = table.deepcopy(data.raw["electric-pole"]["substation"])
local con_point = {
  wire = {green = util.by_pixel(27, -6), red = util.by_pixel(26, -2)},
  shadow = {green = util.by_pixel(37, 4), red = util.by_pixel(36, 8)},
}
data:extend{
  {
    type = "constant-combinator",
    name = "recursive-blueprints-scanner",
    allow_copy_paste = false,
    activity_led_light_offsets = {{0,0}, {0,0}, {0,0}, {0,0}},
    activity_led_sprites = {filename = "__core__/graphics/empty.png", size = 1},
    circuit_wire_connection_points = {con_point, con_point, con_point, con_point},
    circuit_wire_max_distance = 9,
    close_sound = accumulator.close_sound,
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    corpse = "substation-remnants",
    damaged_trigger_effect = substation.damaged_trigger_effect,
    drawing_box = {{-1, -2.5}, {1, 1}},
    dying_explosion = "substation-explosion",
    flags = {
      "placeable-neutral",
      "player-creation",
      "hide-alt-info",
      "not-rotatable",
    },
    icon = "__patorio-recursive-blueprints__/graphics/scanner-icon.png",
    icon_mipmaps = 4,
    icon_size = 64,
    item_slot_count = 10,
    max_health = 200,
    minable = {mining_time = 0.1, result = "recursive-blueprints-scanner"},
    open_sound = accumulator.open_sound,
    selection_box = {{-1, -1}, {1, 1}},
    sprites = {
      layers = {
        {
          filename = "__patorio-recursive-blueprints__/graphics/scanner.png",
          width = 69,
          height = 135,
          shift = util.by_pixel(0, -31),
          priority = "high",
          hr_version = {
            filename = "__patorio-recursive-blueprints__/graphics/hr-scanner.png",
            width = 138,
            height = 270,
            shift = util.by_pixel(0, -31),
            scale = 0.5,
            priority = "high",
          },
        },
        -- Shadow
        substation.pictures.layers[2],
      }
    },
    vehicle_impact_sound = substation.vehicle_impact_sound,
  }
}
