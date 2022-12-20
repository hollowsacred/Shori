async function getQrCode() {
  const data = '{"data":"https://www.qrcode-monkey.com","config":{"body":"rounded-pointed","eye":"frame14","eyeBall":"ball16","erf1":[],"erf2":["fh"],"erf3":["fv"],"brf1":[],"brf2":["fh"],"brf3":["fv"],"bodyColor":"#5C8B29","bgColor":"#FFFFFF","eye1Color":"#3F6B2B","eye2Color":"#3F6B2B","eye3Color":"#3F6B2B","eyeBall1Color":"#60A541","eyeBall2Color":"#60A541","eyeBall3Color":"#60A541","gradientColor1":"#5C8B29","gradientColor2":"#25492F","gradientType":"radial","gradientOnEyes":false,"logo":""},"size":300,"download":false,"file":"png"}'
  const options = {
    method: 'POST',
    headers: {
      'content-type': 'application/json',
      'X-RapidAPI-Key': 'SIGN-UP-FOR-KEY',
      'X-RapidAPI-Host': 'qrcode-monkey.p.rapidapi.com'
    },
    body: JSON.stringify(data),
  };
  const res = await fetch("https://qrcode-monkey.p.rapidapi.com/qr/custom", options);
  console.log(res);
  let qrCode = await res.json();
  return qrCode;
}

export { getQrCode };
