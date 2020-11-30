from flask_admin.contrib.sqla import ModelView
from app import admin
from .models import *

admin.add_view(ModelView(Theloai, db.session))
admin.add_view(ModelView(Tacgia, db.session))
admin.add_view(ModelView(Sach, db.session))
admin.add_view(ModelView(Taikhoan, db.session))
admin.add_view(ModelView(Hoadon, db.session))
admin.add_view(ModelView(Khachhang, db.session))
admin.add_view(ModelView(Quydinh, db.session))