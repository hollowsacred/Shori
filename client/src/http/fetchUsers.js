const fetchGetAllManagers = async () => {
  const res = await fetch('http://localhost:5000/api/users');
  return await res.json();
}
const fetchDeleteAdmin = async (id) => {
  const res = await fetch(`http://localhost:5000/api/user/${id}`, {
    method: 'DELETE',
  });
  return await res.json();
}

const fetcthAddManager = async (data) => {
  const res = await fetch ('http://localhost:5000/api/users', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json;charset=utf-8'
    },
    body: JSON.stringify(data),
  });

  return await res.json();
}



export {
  fetchGetAllManagers,
  fetchDeleteAdmin,
  fetcthAddManager,
}