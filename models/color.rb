class Color < ApplicationRecord
  # สมมติ column ใน database ชื่อ hex_code
  def hex
    hex_code
  end
end
