import React from 'react'
import { useFormik } from 'formik';
import  userSchema  from './Validation'
function Signup() {
    const {handleSubmit,handleChange,handleBlur,values,errors,touched} = useFormik({
        initialValues: {
          password: "",
          Confirmpassword: "",
          email: "",
        },
        onSubmit: values => {
          console.log(values)     
        },
        validationSchema: userSchema,
      });
  return (
    <div>
        <h1>Sign Up</h1>
      <form onSubmit={handleSubmit}>
        <label htmlFor="Password">Password</label>
        <input id="Password"
         name="password" 
         value={values.password} 
          onChange={handleChange}
          onBlur={handleBlur}
          />
{
    errors.password && touched.password &&<div className='error'>{errors.password}</div>
}


<br></br>
        <label htmlFor="lastName">Confirmpassword</label>
        <input id="Confirmpassword"
         name="Confirmpassword" 
         value={values.Confirmpassword}
           onChange={handleChange}
           onBlur={handleBlur}
/>
{
    errors.Confirmpassword && touched.Confirmpassword && <div className='error'>{errors.Confirmpassword}</div>
}

        <br></br>

        <label htmlFor="email">Email</label>
        <input
          id="email"
          name="email"
          placeholder="jane@acme.com"
          type="email"
          value={values.email}
          onChange={handleChange}
          onBlur={handleBlur}
        />
        {
    errors.email && touched.email && <div className='error'>{errors.email}</div>
}

<br></br>
<br></br>




        <button type="submit">Submit</button>
<br></br>
<br></br>
        {<code>{JSON.stringify(values)}</code>}
      </form>

    </div>
  )
}

export default Signup
