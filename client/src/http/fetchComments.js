async function getAllCommentsById(id) {
  const res = await fetch(`http://127.0.0.1:5000/api/comments/${id}`);
  return await res.json();
}

async function addComment(data) {
  console.log(data);
  const res = await fetch('http://127.0.0.1:5000/api/comments', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json;charset=utf-8'
    },
    body: JSON.stringify(data),
  })
  return await res.json();
}

export {
  getAllCommentsById,
  addComment,
}