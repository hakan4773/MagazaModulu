import {useState,useEffect} from 'react'
import './styles.css'

function Form({sendValue,setValue}) {

  const [form,setForm]=useState({name:"",isCompleted:false});
  const [filtered,setfilteredText]=useState("");
  const [filter,setFilter]=useState("all");



//Todo Liste Eleman EKleme
  const HandleChange=(e)=>{
    setForm({...form,[e.target.name]:e.target.value})
  }
  const handleFilterChange =(e)=>{
    setFilter(e.target.value)
  }
//Combobox ile filtreleme
const filteredItems = sendValue.filter((todo) => {
  if (filter === "all") return true;
  if (filter === "completed") return todo.isCompleted;
  if (filter === "notCompleted") return !todo.isCompleted;

  return true;
});


//Yeni eleman ekleme tıklanınca
const HandleSubmit=(e)=>{
e.preventDefault();
if(form.name.trim()===""){
  return false
}
else{
const newtodo={
  name: form.name,
  isCompleted: form.isCompleted === "true", 
}
setValue([...sendValue,newtodo])
setForm({name :"",isCompleted:false})
  }}


    
  const HandleRemove=(id)=> {//silme
    const updateItmes=sendValue.filter((value,index)=> index !==id) 

    localStorage.removeItem(updateItmes)
    setValue(updateItmes)
   }

// Inside useEffect for saving to local storage
useEffect(() => {
  localStorage.setItem("Items", JSON.stringify(sendValue));
}, [sendValue]);

// Inside useEffect for loading from local storage
useEffect(() => {
  const savedItems = JSON.parse(localStorage.getItem('Items'));
  if (savedItems) {
    setValue(savedItems);
  }
}, [setValue]);


const HandleApprove = (id) => {
  const updatedItems = sendValue.map((item, index) =>
    index === id ? { ...item, isCompleted: !item.isCompleted } : item
  );
  setValue(updatedItems);
};
  return (
<div className="Todo">
<h1>My-Todo-List</h1>
<div className='Top'>
<input className='input'  
placeholder='Görev Ekleyin'
name='name'
value={form.name}
onChange={HandleChange} 
/>

          
<button className='btn' onClick={HandleSubmit} >Add</button>

<div className="Filter">
        <label>Filtrele: </label>
        <select value={filter} onChange={handleFilterChange}>
          <option value="all">All</option>
          <option value="completed">Completed</option>
          <option value="notCompleted">Not Completed</option>
        </select>

        </div>
        </div>

      

<ul>

{//listeleme
filteredItems.map((item,index)=>

<li key={index} className='task'>

<span style={{ textDecoration: item.isCompleted ? 'line-through' : 'none' }}>{item.name}</span>
<button className='destroy' onClick={()=>HandleRemove(index)}>Delete</button>{/* //silme butonu */}
<button className='demo-btn1-hover' onClick={() => HandleApprove(index)}>Tamam
{item.isCompleted ? true : false} {/* Durumunu değiştirme */}
</button>

</li>

)}


</ul>
<p> <b>{filteredItems.length}</b> Görev bulundu</p>
<a  href='#' onClick={()=>setValue([])}>ClearAll</a>
    </div> 
  )
}

export default Form
