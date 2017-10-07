class User
end

# Userクラス自身のクラスはClassクラス
User.class #=> Class

# ClassクラスのスーパークラスはModuleクラス
User.class.superclass #=> Module

module Loggable
end

# Loggableモジュール自身のクラスはModuleクラス
Loggable.class #=> Module

# ModuleクラスのスーパークラスはObjectクラス
Loggable.class.superclass #=> Object


class User
  p self       #=> User
  p self.class #=> Class
end

module Loggable
  p self       #=> Loggable
  p self.class #=> Module
end
