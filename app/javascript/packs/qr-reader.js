import { BrowserQRCodeReader } from '@zxing/browser';
const codeReader = new BrowserQRCodeReader();
const video = document.querySelector("#video");
codeReader.decodeOnceFromVideoDevice(undefined, video).then((result) => {
  document.getElementById('result').textContent = result.text
  location.href = result.text;
});
stop()