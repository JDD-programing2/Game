class Enemy
	attr_accessor :mesh, :expired

	# 初期化
	def initialize(radius, textures)

		#敵の初期値設定
		#x = rand(30) - 15
		#y = rand(2) + 3
		#z = rand(30) - 15
		x = rand(-30..30) 
		y = rand(-50..-45) + 3 #-40～-50ランダムに
		z = rand(45..50) - 5
		pos = Mittsu::Vector3.new(x, y, -z)
		
		index = rand(2)
		self.mesh = MeshFactory.create_enemy(r: radius, map:textures[index])
		self.mesh.position = pos
		self.expired = false
	end

	# メッシュの現在位置を返す
	def position
		self.mesh.position
	end

	# 1フレーム分の進行処理
	#敵を振動？させるプログラム
	#今回はポジションの変化値を0にして動かないようにしている
	def play(tank_position)
		dx = rand(5)
		dy = rand(5)
		dz = rand(5)
		dx1 =rand(6)

        #mesh.position.z -=0.1

        case dx1
		when 1
			if(self.mesh.position.x < tank_position.x)
				self.mesh.position.x += 0.02
			end

			if(self.mesh.position.x > tank_position.x)
				self.mesh.position.x -= 0.02
			end

		when 2
			if(self.mesh.position.x < tank_position.x)
				self.mesh.position.x += 0.02
			end

			if(self.mesh.position.x > tank_position.x)
				self.mesh.position.x -= 0.02
			end

		when 3
			if(self.mesh.position.z < tank_position.z)
				self.mesh.position.z += 0.02
			end

			if(self.mesh.position.z > tank_position.z)
				self.mesh.position.z -= 0.02
			end

		when 4
			if(self.mesh.position.z < tank_position.z)
				self.mesh.position.z += 0.02
			end

			if(self.mesh.position.z > tank_position.z)
				self.mesh.position.z -= 0.02
			end

		when 5
			if(self.mesh.position.y < tank_position.y)
				self.mesh.position.y += 0.02
			end

			if(self.mesh.position.y > tank_position.y)
				self.mesh.position.y -= 0.02
			end
		end


		# if(self.mesh.position.z < tank_position.z)
		# 	self.mesh.position.z += 0.02
		# end

		# if(self.mesh.position.x < tank_position.x)
		# 	self.mesh.position.x += 0.02
		# end

		# if(self.mesh.position.y < tank_position.y)
		# 	self.mesh.position.y += 0.008
		# end

		# if(self.mesh.position.z > tank_position.z)
		# 	self.mesh.position.z -= 0.02
		# end

		# if(self.mesh.position.x > tank_position.x)
		# 	self.mesh.position.x -= 0.02
		# end

		# if(self.mesh.position.y > tank_position.y)
		# 	self.mesh.position.y -= 0.008
		# end


		case dx
		when 1
			self.mesh.position.x += 0.1
		when 2
			self.mesh.position.x -= 0.1
		end

		# case dy
		# when 1
		# 	self.mesh.position.y += 0.008
		# when 2
		# 	self.mesh.position.y -= 0.008
		# end

		case dz
		when 1
			self.mesh.position.z += 0.1
		when 2
			self.mesh.position.z -= 0.1
		end

		# 常に戦車を見る
		self.mesh.look_at(tank_position)
		self.mesh.rotate_y(Math::PI*3/2)
	end
end