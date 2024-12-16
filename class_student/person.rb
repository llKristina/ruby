class Person
	attr_reader :id, :git

	# Конструктор для базового класса
	def initialize(id: nil, git: nil)
		self.id = id
		self.git = git
	end

	# Валидация методов
	def self.valid_git?(git)
		!!(git =~ /\Agithub\.com\/[a-zA-Z0-9_-]+\z/)
	end
	
	def self.valid_id?(id)
		id.is_a?(Integer) && id > 0
	end
	  
	def self.valid_surname?(surname)
		raise NotImplementedError, "Метод не реализован в классе Person"
	end

	def self.valid_name?(name)
		raise NotImplementedError, "Метод не реализован в классе Person"  
	end

	def self.valid_patronymic?(patronymic)
		raise NotImplementedError, "Метод не реализован в классе Person"  
	end
	  
	def self.valid_phone?(phone)
		raise NotImplementedError, "Метод не реализован в классе Person"  
	end

	def self.valid_telegram?(telegram)
		raise NotImplementedError, "Метод не реализован в классе Person"  
	end

	def self.valid_email?(email)
		raise NotImplementedError, "Метод не реализован в классе Person"  
	end


	# Переопределяем сеттеры для контактов
	def git=(value)
		raise ArgumentError, "Неверный формат гита" unless self.class.valid_git?(value)
		@git = value
	end
	  
	def id=(value)
		raise ArgumentError, "Неверный формат ID" unless self.class.valid_id?(value)
		@id = id
	end

	def has_git?
		!@github.nil?
	end
	  
	def has_contact?
		!@telegram.nil? || !@phone.nil? || !@email.nil?
	end
	  
	def validate?
		has_contact? && has_git?   
	end
end