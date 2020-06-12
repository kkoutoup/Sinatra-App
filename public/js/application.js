// show-hide form
const postForm = document.getElementById('add-new-post-form');
postForm.style.display = 'none';
const toggleFormLink = document.getElementById('submit-new-post');
toggleFormLink.addEventListener('click', toggleVisibility);

function toggleVisibility(e){
  e.preventDefault();
  if(postForm.style.display === 'block'){
    postForm.style.display = 'none';
    toggleFormLink.innerHTML = "<strong>Submit a new post +</strong>";
  }else{
    postForm.style.display = 'block';
    toggleFormLink.innerHTML = "<strong>Submit a new post -</strong>";
  }
}
// message container
const updateUserPara = document.querySelector('#update-user');
if(updateUserPara){
  setTimeout(function(){
  updateUserPara.style.display = "none";
  }, 2500 )
}