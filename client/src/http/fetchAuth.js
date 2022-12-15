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

async function RegTo(item) {
  const res = await fetch('http://localhost:5000/api/reg', {
    method:'POST',
    headers: {
      'Content-Type': 'application/json;charset=utf-8'
    },
    body:JSON.stringify(item),
  })
  return await res.json();
}


module.exports = {LoginTo, RegTo};