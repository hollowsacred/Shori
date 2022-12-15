async function addItemToCart(user, product) {
  const cartInfo = {user: user.id, product: product.id}
  const res = await fetch('http://localhost:5000/api/cart', {
    method:'POST',
    headers: {
      'Content-Type': 'application/json;charset=utf-8'
    },
    body:JSON.stringify(cartInfo),
  })
  const info = await res.json();
  return info;
}

async function getAllItemsCart() {
  const res = await fetch('http://localhost:5000/api/cart');
  return await res.json();
}

async function deleteItemFromCart(id) {
  const res = await fetch(`http://localhost:5000/api/cart/${id}`,{
    method:'DELETE',
  })
  return await res.json();
}

module.exports = {addItemToCart, getAllItemsCart, deleteItemFromCart};