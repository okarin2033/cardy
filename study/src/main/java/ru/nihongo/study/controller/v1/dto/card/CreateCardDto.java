package ru.nihongo.study.controller.v1.dto.card;

import lombok.Data;

@Data
public class CreateCardDto {
    private String front;
    private String back;
    private String hint;
    private Long deckId;
}