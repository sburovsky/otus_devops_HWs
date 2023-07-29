﻿
&ИзменениеИКонтроль("ОбработкаЗаполнения")
Процедура ODL04_ОбработкаЗаполнения(ДанныеЗаполнения, СтандартнаяОбработка)

	Если НЕ ЭтоГруппа Тогда

		Пользователь = Пользователи.ТекущийПользователь();

		ВидНоменклатуры = ЗначениеНастроекПовтИсп.ВидНоменклатурыПоУмолчанию(Пользователь, ВидНоменклатуры);

		Если ЗначениеЗаполнено(ВидНоменклатуры) Тогда
			ТипНоменклатуры = ВидНоменклатуры.ТипНоменклатуры;
		КонецЕсли;

		ЕдиницаИзмерения = Справочники.БазовыеЕдиницыИзмерения.ПолучитьЕдиницуИзмеренияПоУмолчанию();

		СтавкаНДС = ЗначениеНастроекПовтИсп.СтавкаНДСНовыхНоменклатурныхПозицийПоУмолчанию(Пользователь, СтавкаНДС);

		Если Не ЗначениеЗаполнено(СтавкаНДС) Тогда
			СтавкаНДС = ВидНоменклатуры.СтавкаНДС;
		КонецЕсли;

		#Вставка
		//{ Буровский СВ  15.07.2023 # заполнение ставки НДС по умолчанию
		Если Не ЗначениеЗаполнено(СтавкаНДС) Тогда
			СтавкаНДС = Перечисления.СтавкиНДС.НДС20;
		КонецЕсли;
		// Буровский СВ (СофтЛаб) 15.07.2023 # }
		#КонецВставки
	КонецЕсли;

КонецПроцедуры
