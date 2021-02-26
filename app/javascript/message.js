// function message() {
//   const formSubmit = document.getElementById("form-submit");
//   formSubmit.addEventListener("click",(e) => {
//     const formData = new FormData(document.getElementById("form"));
//     const XHR = new XMLHttpRequest();
//     XHR.open("POST", "/rooms/#{room.id}/messages", true);
//     XHR.responseType = "json";
//     XHR.send(formData);
//     XHR.onload = () => {
//       if (XHR.status != 200) {
//         alert(`Error ${XHR.status}: ${XHR.statusText}`);
//         return null;
//       }
//       const item = XHR.response.room.message;
//       const messages = document.getElementById("message");
//       const messageContent = document.getElementById("message_content");
//       const HTML = `
//         <div class="upper-message">
//           <div class="message-user">
//             ${item.user.name}
//           </div>
//           <div class="message-date">
//             ${item.created_at}
//           </div>
//         </div>
//         <div class="lower-message">
//           <div class="message-content">
//             <% if message.content %>
//             ${room.currency.name} ${item.content.to_s(delimited)}<br>
//             <div class="lower-sub-message">
//               "換算額は¥"${(item.content / room.price * 100).floor.to_s(delimited)}<br>
//               ${room.number}"人で割った1人分の金額は"${room.currency.name}${(item.content /room.number).to_s(delimited)}<br>
//               ${room.number}"人で割った1人分の換算額は¥"${(item.content / room.price * 100 / room.number).floor.to_s(delimited)}
//             <% end %></br>
//             </div>
//           </div>
//           <img src= ${item.image.variant(resize= '300x300')}, class: 'message-image' if message.image.attached? >
//         </div>
//       `;
//       messages.insertAdjacentHTML("afterbegin",HTML);
//       formText.value = "";
//     };
//     e.preventDefault();
//   });
// }
// window.addEventListener("load",message);