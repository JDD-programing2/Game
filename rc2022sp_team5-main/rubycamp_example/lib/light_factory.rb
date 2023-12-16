# 光源オブジェクトのファクトリー
class LightFactory
	# 太陽光の生成
	def self.create_sun_light
		Mittsu::HemisphereLight.new(0xd3c0e8, 0xe7cdb1, 1.0)
	end

	# スポットライトの生成
	#今回はAmbientLightを使用
	def self.create_spot_light

        light = Mittsu::AmbientLight.new(0xffffff) #-> AmbientLight

		# light = Mittsu::SpotLight.new(0xffffff, 2,0)
		# light.position.set(0.0, 30, 50.0)

		# light.cast_shadow = true
		# light.shadow_darkness = 0.1

		# light.shadow_map_width = 2048
		# light.shadow_map_height = 2048

		# light.shadow_camera_near = 1.0
		# light.shadow_camera_far = 100.0
		# light.shadow_camera_fov = 60.0

		# light.shadow_camera_visible = false
		# light
	end
end