window.onload = function () {
    new WOW().init();
    var posts = [
        { id: 1, title: "강남구 정책정보를 알려드립니다", author: "홍길동", date: "2023-11-30" },
        { id: 2, title: "강서구 정책정보를 알려드립니다", author: "홍길순", date: "2023-11-30" },
        { id: 3, title: "서대문구 정책정보를 알려드립니다", author: "홍길순", date: "2023-11-30" },
        { id: 4, title: "마포구 정책정보를 알려드립니다", author: "홍길순", date: "2023-11-30" },
        { id: 5, title: "중구 정책정보를 알려드립니다", author: "홍길순", date: "2023-11-30" },
        { id: 6, title: "종로구 정책정보를 알려드립니다", author: "홍길순", date: "2023-12-04" },
        { id: 7, title: "용산구 정책정보를 알려드립니다", author: "홍길순", date: "2023-12-04" },
    ];


    var tableBody = document.querySelector("#board-table tbody");
    for (var i = 0; i < posts.length; i++) {
        var row = document.createElement("tr");


        var idCell = document.createElement("td");
        idCell.textContent = posts[i].id;

        var titleCell = document.createElement("td");
        titleCell.innerHTML = '<a href ="#" style="color: #1c3664;">' + posts[i].title + "</a>";

        var authorCell = document.createElement("td");
        authorCell.textContent = posts[i].author;

        var dateCell = document.createElement("td");
        dateCell.textContent = posts[i].date;

        row.appendChild(idCell);
        row.appendChild(titleCell);
        row.appendChild(authorCell);
        row.appendChild(dateCell);

        tableBody.appendChild(row);


    }
};

