document.addEventListener('DOMContentLoaded', () => {
  let index = 0;
  const audioElements = document.getElementsByTagName('audio');
  console.log('Audio elements gathered');

  function playNext(index) {
    audioElements[index].play();
    audioElements[index].addEventListener('ended', function() {
      index++;
      if (index < audioElements.length) {
        console.log('Playing last');
        playNext(index);
      }
    });
  }

  document.getElementById('play').addEventListener('click', function() {
    console.log('Start play');
    audioElements[index].play();
    audioElements[index].addEventListener('ended', function() {
      index++;
      if (index < audioElements.length) {
        console.log('Playing next');
        playNext(index);
      }
    });
  });
});
