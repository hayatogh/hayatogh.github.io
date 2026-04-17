document.querySelectorAll('.copy-code-button').forEach((button) => {
  button.addEventListener('click', () => {
    const code = button.parentElement.querySelector('code').textContent;
    navigator.clipboard.writeText(code);

    button.style.opacity = '0.5';
    setTimeout(() => button.style.opacity = '1', 200);
  });
});
