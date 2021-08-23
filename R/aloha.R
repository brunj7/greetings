
#' Says Aloah to a friend
#'
#' @param name a character
#' @param print a logical
#'
#' @return (character) An aloha message
#' @export
#'
#' @examples say_aloha("Allison")
say_aloha <- function(name, color, text) {

  message <- paste("Aloha,",
                   name,
                   emo::ji("palm_tree"),
                   emo::ji("sunny"),
                   emo::ji("ocean"))
if (color == "green" & text =="yellow") {
  cat(crayon::yellow(crayon::bgGreen(message)))}
  else {cat(crayon::black((crayon::bgCyan(message))))}

}
