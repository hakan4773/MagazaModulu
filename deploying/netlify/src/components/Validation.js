import React from 'react'
import {object,string,number,ref} from 'yup'; 

const userSchema = object({
        email: string().email('Geçerli bir E-mail girin!').required('Zorunlu alan'),
        password: string().min(5,'Parolanız en az 5 karakter olmalı').required('Zorunlu alan'),
        Confirmpassword: string().oneOf([ref("password")],"Parolalar uyuşmuyor").required('Zorunlu alan')
      });

export default userSchema
