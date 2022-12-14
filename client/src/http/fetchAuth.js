async function LoginTo(item) {
  const res = await fetch('http://localhost:5000/api/auth',{
    method:'POST',
    headers: {
      'Content-Type': 'application/json;charset=utf-8'
    },
    body:JSON.stringify(item),
  })
  const user = await res.json();
  return user;
}


module.exports = {LoginTo};