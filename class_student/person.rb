class Person
  attr_reader :id, :git

  # Конструктор для базового класса
  def initialize(id: nil, git: nil)
    @id = id
    self.git = git
  end

  # Валидация методов
  def self.valid_git?(git)
    !!(git =~ /\Agithub\.com\/[a-zA-Z0-9_-]+\z/)
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

  def has_git?
    !@github.nil?
  end
  
  def validate
    raise NotImplementedError, "Метод не реализован в классе Person"   
  end
  
end