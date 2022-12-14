async function getAllProducts() {
 const res = await fetch('http://localhost:5000/api/products');
 const products = await res.json();
 return products;
}

async function addProduct(data) {
 const res = await fetch('http://localhost:5000/api/products',{
    method:'POST',
    body:data,
  });
  const product = await res.json();
  return product;
}

async function deleteProductItem(id) {
  const res = await fetch(`http://localhost:5000/api/products/${id}`, {
    method: 'DELETE',
  })
  return await res.json();
}

export {getAllProducts, addProduct, deleteProductItem};