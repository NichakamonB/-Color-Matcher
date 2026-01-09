# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  # แสดงหน้าฟอร์ม Login
  def new
  end

  # รับค่าจากฟอร์มเพื่อตรวจสอบ (Process Login)
  def create
    # 1. หา User จาก Email ที่ส่งมา
    user = User.find_by(email: params[:email])

    # 2. ตรวจสอบว่า User มีอยู่จริง และ รหัสผ่านถูกต้อง (authenticate มาจาก bcrypt)
    if user && user.authenticate(params[:password])
      # 3. ถ้าผ่าน: บันทึก user_id ลงใน session (เปรียบเสมือนบัตรผ่าน)
      session[:user_id] = user.id
      redirect_to root_path, notice: "ยินดีต้อนรับกลับ! เข้าสู่ระบบสำเร็จแล้ว"
    else
      # 4. ถ้าไม่ผ่าน: แจ้งเตือนและแสดงหน้า Login ใหม่
      flash.now[:alert] = "อีเมลหรือรหัสผ่านไม่ถูกต้อง"
      render :new, status: :unprocessable_entity
    end
  end

  # ออกจากระบบ (Logout)
  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "ออกจากระบบเรียบร้อยแล้ว"
  end
end