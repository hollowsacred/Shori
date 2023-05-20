async function fetchGetAllContacts() {
  const res = await fetch('http://127.0.0.1:5000/api/contacts/');

  return await res.json();
}

export { fetchGetAllContacts };