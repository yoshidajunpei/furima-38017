document.addEventListener('DOMContentLoaded', function(){
    // 新規投稿・編集ページのフォームを取得
    const postForm = document.getElementById('item-image');
    //プレビュー表示するためのスペースを取得
    const previewList = document.getElementById('previews');
    // 新規投稿・編集ページのフォームがないならここで終了。「!」は論理否定演算子。
    if (!postForm) return null;
    console.log("preview.jsが読み込まれました");
    // 投稿できる枚数の制限を定義
    const imageLimits = 5;

    // プレビュー画像を生成・表示する関数
    const buildPreviewImage = (dataIndex, blob) =>{
     // 画像を表示するためのdiv要素を生成
     const previewWrapper = document.createElement('div');
     previewWrapper.setAttribute('class', 'preview');
     previewWrapper.setAttribute('data-index', dataIndex);
     
     // 表示する画像を生成
     const previewImage = document.createElement('img');
     previewImage.setAttribute('class', 'preview-image');
     previewImage.setAttribute('src', blob);
     previewImage.classList.add('preview-size');

    // 削除ボタンを生成
    const deleteButton = document.createElement("div");
    deleteButton.setAttribute("class", "image-delete-button");
    deleteButton.innerText = "削除";

    // 削除ボタンをクリックしたらプレビューとfile_fieldを削除させる
    deleteButton.addEventListener("click", () => deleteImage(dataIndex));
     
     // 生成したHTMLの要素をブラウザに表示させる
     previewWrapper.appendChild(previewImage);
     previewWrapper.appendChild(deleteButton);
     previewList.appendChild(previewWrapper);
    };

    // file_fieldを生成・表示する関数
    const buildNewFileField = () => {
        // 2枚目用のfile_fieldを作成
        const newFileField = document.createElement('input');
        newFileField.setAttribute('type', 'file');
        newFileField.setAttribute('name', 'item[images][]');
        
        // 最後のfile_fieldを取得
        const lastFileField = document.querySelector('input[type="file"][name="item[images][]"]:last-child');
        // nextDataIndex = 最後のfile_fieldのdata-index + 1
        const nextDataIndex = Number(lastFileField.getAttribute('data-index')) +1;
        newFileField.setAttribute('data-index', nextDataIndex);

        // 追加されたfile_fieldにchangeイベントをセット
        newFileField.addEventListener("change", changedFileField);
       
        // 生成したfile_fieldを表示
        const fileFieldsArea = document.querySelector('.click-upload');
        fileFieldsArea.appendChild(newFileField)
    };

    //指定したdata-indexを持つプレビューとfile_fieldを削除する
    const deleteImage =(dataIndex) => {
      const deletePreviewImage = document.querySelector(`.preview[data-index="${dataIndex}"]`);
      deletePreviewImage.remove();
      const deleteFileField = document.querySelector(`input[type="file"][data-index="${dataIndex}"]`);
      deleteFileField.remove();

     // 画像の枚数が最大のときに削除ボタンを押した場合、file_fieldを1つ追加する
    const imageCount = document.querySelectorAll(".preview").length;
    if (imageCount == imageLimits - 1) buildNewFileField();
    };

    // input要素で値の変化が起きた際に呼びだされる関数の中身
     const changedFileField = (e) => {
     // data-index（何番目を操作しているか）を取得
     const dataIndex = e.target.getAttribute('data-index');

     const file = e.target.files[0];

     // fileが空 = 何も選択しなかったのでプレビュー等を削除して終了する
     if (!file) {
       deleteImage(dataIndex);
       return null;
     };


     const blob = window.URL.createObjectURL(file);

     // data-indexを使用して、既にプレビューが表示されているかを確認する
     const alreadyPreview = document.querySelector(`.preview[data-index="${dataIndex}"]`);
    
     if (alreadyPreview) {
      // クリックしたfile_fieldのdata-indexと、同じ番号のプレビュー画像が既に表示されている場合は、画像の差し替えのみを行う
      const alreadyPreviewImage = alreadyPreview.querySelector("img");
      alreadyPreviewImage.setAttribute("src", blob);
      return null;
    };
    //  古いプレビューが存在する場合は削除
    //  const alreadyPreview = document.querySelector('.preview');
    //  if (alreadyPreview) {
    //     alreadyPreview.remove();
    //   };
     


     


      
      buildPreviewImage(dataIndex, blob);
      // 画像の枚数制限に引っかからなければ、新しいfile_fieldを追加する
      const imageCount = document.querySelectorAll(".preview").length;
      if (imageCount < imageLimits) buildNewFileField();
    };

    // input要素を取得
    const fileField = document.querySelector('input[type="file"][name="item[images][]"]');

    // input要素で値の変化が起きた際に呼び出される関数

    fileField.addEventListener('change', changedFileField);
  });

    fileField.addEventListener('change', function(e){
      console.log("input要素で値の変化が起きました");
    // 古いプレビューが存在する場合は削除
    const alreadyPreview = document.querySelector('.preview');
    if (alreadyPreview) {
      alreadyPreview.remove();
    };
      console.log(e.target.files[0]);
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
    // 画像を表示するためのdiv要素を生成
    const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class', 'preview');
    // 表示する画像を生成
    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'preview-image');
    previewImage.setAttribute('src', blob);
    // CSSを使用した際の記述方法：previewImage.classList.add('preview-size');
    previewImage.width = 200;
    previewImage.height = 200;


    // 生成したHTMLの要素をブラウザに表示させる
    previewWrapper.appendChild(previewImage);
    previewList.appendChild(previewWrapper);
    });


