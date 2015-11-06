function countView() {
  $.post("http://" + window.location.host + "/countview", {script_slug: location.pathname.split('scripts/')[1]} )
}