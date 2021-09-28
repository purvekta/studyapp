class CourseUrlData {
  String id;
  String createDate;
  String courseName;
  String coursePrice;
  String courseImg;
  String offerPrice;
  String isPaid;
  String lastUpdated;
  List<Topic> topic;

  CourseUrlData(
      {this.id,
      this.createDate,
      this.courseName,
      this.coursePrice,
      this.courseImg,
      this.offerPrice,
      this.isPaid,
      this.lastUpdated,
      this.topic});

  CourseUrlData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createDate = json['create_date'];
    courseName = json['course_name'];
    coursePrice = json['course_price'];
    courseImg = json['course_img'];
    offerPrice = json['offer_price'];
    isPaid = json['is_paid'];
    lastUpdated = json['last_updated'];
    if (json['topic'] != null) {
      topic = new List<Topic>();
      json['topic'].forEach((v) {
        topic.add(new Topic.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['create_date'] = this.createDate;
    data['course_name'] = this.courseName;
    data['course_price'] = this.coursePrice;
    data['course_img'] = this.courseImg;
    data['offer_price'] = this.offerPrice;
    data['is_paid'] = this.isPaid;
    data['last_updated'] = this.lastUpdated;
    if (this.topic != null) {
      data['topic'] = this.topic.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Topic {
  String id;
  String createDate;
  String title;
  String link;
  String courseId;
  String isLocked;
  String lastUpdated;

  Topic(
      {this.id,
      this.createDate,
      this.title,
      this.link,
      this.courseId,
      this.isLocked,
      this.lastUpdated});

  Topic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createDate = json['create_date'];
    title = json['title'];
    link = json['link'];
    courseId = json['course_id'];
    isLocked = json['is_locked'];
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['create_date'] = this.createDate;
    data['title'] = this.title;
    data['link'] = this.link;
    data['course_id'] = this.courseId;
    data['is_locked'] = this.isLocked;
    data['last_updated'] = this.lastUpdated;
    return data;
  }
}
